# 
# Do NOT Edit the Auto-generated Part!
# Generated by: spectacle version 0.32
# 

Name:       wifi-qr-handler

# >> macros
# << macros

Summary:    register WIFI scheme and open Settings
Version:    0.1.0
Release:    0
Group:      Applications
License:    ASL 2.0
BuildArch:  noarch
URL:        https://github.com/nephros/wifi-qr-handler
Source0:    %{name}-%{version}.tar.gz
Source100:  wifi-qr-handler.yaml
Source101:  wifi-qr-handler-rpmlintrc
BuildRequires:  desktop-file-utils

%description
%{summary}.


%prep
%setup -q -n %{name}-%{version}/upstream

# >> setup
# << setup

%build
# >> build pre
# << build pre



# >> build post
# << build post

%install
rm -rf %{buildroot}
# >> install pre
install -m 644 -D %{name}.desktop %{buildroot}%{_datadir}/applications/%{name}.desktop
# << install pre

# >> install post
# << install post

desktop-file-install --delete-original       \
  --dir %{buildroot}%{_datadir}/applications             \
   %{buildroot}%{_datadir}/applications/*.desktop

%files
%defattr(-,root,root,-)
%{_datadir}/applications/%{name}.desktop
# >> files
# << files