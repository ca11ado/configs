function lm
  set -l lamoda_home ~/Projects/Lamoda/Frontend

  switch $argv[1]
    case -site
      pushd $lamoda_home

      switch $argv[2]
        case ru
          ./manage.py runserver --settings=frontend_xslt.settings.ru
        case ua
          ./manage.py runserver --settings=frontend_xslt.settings.ua 8001
        case kz
          ./manage.py runserver --settings=frontend_xslt.settings.kz 8002
        case by
          ./manage.py runserver --settings=frontend_xslt.settings.by 8003
        case fifa
          ./manage.py runserver --settings=frontend_xslt.settings.fifa 8004
        case '*'
          echo unknown site
      end

      popd
  end
end
