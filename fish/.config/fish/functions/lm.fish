function lm
  set -l lamoda_home ~/Projects/Lamoda/Frontend

  switch $argv[1]
    case -help
      echo -site -- run site instance
      echo -configs -- update site configs
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
          ./manage.py runserver --settings=frontend_xslt.settings.fifa 8009
        case '*'
          echo unknown site
      end

      popd
  case -configs
    update_configs    
  case '*'
    echo unknown argument
  end
end


function update_configs
  set c_date (date "+%d.%m.%y_%H:%M:%S")
  set sites ru by kz ua

  mkdir $HOME/Projects/Lamoda/savedFiles/$c_date
  for val in $sites
    cp $HOME/Projects/Lamoda/Frontend/etc/apilib.$val.conf.proto /etc/lamoda/apilib.$val.conf
  end

  #fifa
  cp $HOME/Projects/Lamoda/Frontend/etc/apilib.ru.conf.proto /etc/lamoda/apilib.fifa.conf

  echo bakup directory: $HOME/Projects/Lamoda/savedFiles/$c_date
end
