Name:       frontend-lab-app
Version:    BUILD_NUMBER
Release:    1
Summary:    Most simple RPM package
License:    FIXME

%description
frontend-lab-app

%prep
# we have no source, so nothing here

%build
echo "Generating package"

%install
mkdir -p %{buildroot}/var/www/html
install -m 755 /var/lib/jenkins/workspace/frontend-lab-app/index.html %{buildroot}/var/www/html/index.html

%files
/var/www/html/index.html

%changelog
# let skip this for now
