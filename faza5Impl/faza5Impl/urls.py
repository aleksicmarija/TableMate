"""
URL configuration for proj project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

import Stolari.views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', Stolari.views.login, name='login'),
    path('logout/', Stolari.views.logout_view, name='logout'),
    path('userProfile/', Stolari.views.user_profile_view, name='user_profile'),
    path('pregledRezervacija/', Stolari.views.pregledRezervacija, name='pregledRezervacija'),
    path('register.html', Stolari.views.register_render, name='register_render'),
    path('register/', Stolari.views.register, name='register'),
    path('pregledKorisnika/', Stolari.views.pregledKorisnika, name='pregledKorisnika'),
    path('korisnik/<int:idrreg>', Stolari.views.obrisiKorisnika, name='obrisiKorisnika'),
    path('prikazVesti/', Stolari.views.prikazVesti, name='prikazVesti'),
    path('formaDodajVesti/', Stolari.views.formaDodajVesti, name='formaDodajVesti'),
    path('dodajVesti/', Stolari.views.dodajVesti, name='dodajVesti'),
    path('explore.html', Stolari.views.explore_render, name='explore_render'),
    path('prikaziExplore/', Stolari.views.prikaziExplore, name='prikaziExplore'),
    path('prikaziExplore/prikaziStranicuObjekta/<int:idobj>/', Stolari.views.prikaziStranicuObjekta,
         name='prikaziStranicuObjekta'),
    path('prikaziSortiranExplore/', Stolari.views.prikaziSortiranExplore, name='prikaziSortiranExplore'),
    path('belgrade/', Stolari.views.belgrade, name='belgrade'),
    path('nis/', Stolari.views.nis, name='nis'),
    path('noviSad/', Stolari.views.noviSad, name='noviSad'),
    path('clubs/', Stolari.views.clubs, name='clubs'),
    path('pubs/', Stolari.views.pubs, name='pubs'),
    path('restaurants/', Stolari.views.restaurants, name='restaurants'),
    path('italian/', Stolari.views.kuhinjaItalian, name='italian'),
    path('serbian/', Stolari.views.kuhinjaSerbian, name='serbian'),
    path('reviews/', Stolari.views.reviews, name='reviews'),
    path('prikaziExplore/prikaziStranicuObjekta/<int:idobj>/add_favorites/', Stolari.views.add_favorites,
         name='add_favorites'),
    path('prikaziExplore/prikaziStranicuObjekta/<int:idobj>/delete_favorites/', Stolari.views.delete_favorites,
         name='delete_favorites'),
    path('prikaziOmiljene/', Stolari.views.prikaziOmiljene, name='prikaziOmiljene'),
    path('prikaziExplore/prikaziStranicuObjekta/<int:idobj>/oceni_objekat/', Stolari.views.oceni_objekat,
         name='oceni_objekat'),
]
