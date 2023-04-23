from django.shortcuts import render, redirect
from .models import Admin, Menadzer, Registrovani
from django.contrib.auth import logout

def login(request): #login logika - Pavle Perovic 0594/14
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        if Admin.objects.filter(username=username, password=password).exists():
            request.session['username'] = username
            return render(request, 'admin.html')
        elif Menadzer.objects.filter(username=username, password=password).exists():
            request.session['username'] = username
            return render(request, 'menadzer.html')
        elif Registrovani.objects.filter(username=username, password=password).exists():
            request.session['username'] = username
            return render(request, 'userIndex.html')
        else:
            poruka = "Pogresan username ili password"
            return render(request, 'login.html', {'poruka': poruka, 'template_name': 'login.html'})
    else:
        return render(request, 'login.html', {'template_name': 'login.html'})

def logout_view(request): #logout logika - Pavle Perovic
    logout(request) #logout radi i flush i modified = true
    return redirect('login') #skoci na pocetnu stranu

def register_render(request): #hendler za redirect - Pavle Perovic
    return render(request, 'register.html')

def register(request): #registracija korisnika - Pavle Perovic
    error = ''
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        first_name = request.POST.get('firstName')
        last_name = request.POST.get('lastName')
        number = request.POST.get('number')
        gender = request.POST.get('gender')
        datetime = request.POST.get('datetime')

        if username is None or password is None or first_name is None or last_name is None or number is None or gender is None or datetime is None:
            error = 'Neispravan unos!'
            return render(request, 'register.html', {'error': error})
        if username.strip() == '' or password.strip() == '' or first_name.strip() == '' or last_name.strip() == '' or number.strip() == '' or gender.strip() == '' or datetime.strip() == '':
            error = 'Sva polja moraju biti popunjena!'
            return render(request, 'register.html', {'error': error})
        #Obrada unique podataka.
        if Registrovani.objects.filter(username=username).exists():
            error = 'Username vec postoji!'
            return render(request, 'register.html', {'error': error})
        if Registrovani.objects.filter(brtelefona=number).exists():
            error = 'Broj telefona vec postoji!'
            return render(request, 'register.html', {'error': error})

        # Insert
        user = Registrovani(username=username, password=password, ime=first_name, prezime=last_name, brtelefona=number, pol=gender, datumrodjenja=datetime, pozpoeni=0, negpoeni=0)
        user.save()

        # Redirektujemo se na pocetnu stranicu
        return redirect('login')

    # ako metoda nije POST
    error = 'Metoda nije POST!'
    return render(request, 'register.html', {'error': error})






