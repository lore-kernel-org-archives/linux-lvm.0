Date: Tue, 11 Sep 2001 10:21:56 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20010911102155.B12843@colombina.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvm-cvs.spec
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

%define name lvm
%define version 1.0.1
%define release 1CVS
Name: %{name}
Version: %{version}
Release: %{release}
Summary: Heinz Mauelshagen's LVM (Logical Volume Manager) for Linux
Group: System Environment/Base
Copyright: GPL
Source0: lvm-cvs.tar.bz2
BuildRoot: /tmp/%{name}-%{version}-root
Packager: Luca Berra <bluca@vodka.it>
%description
It includes all of the support for handling read/write operations on
physical volumes (hard disks, RAID-Systems, magneto optical, etc. and
even multiple devices (MD), see mdadd(8) etc.), creating volume groups
from one or more physical volumes and creating one or more logical volumes
in volume groups.

#:r!date "+\%a \%b \%d \%Y"
%changelog

%prep
%setup -q -n LVM
%define _exec_prefix %{nil}
%configure --with-user=`id -un` --with-group=`id -gn`

%build

%install
rm -Rf $RPM_BUILD_ROOT
%makeinstall
ln -snf /lib/liblvm-10.so.CVS.CVS $RPM_BUILD_ROOT/usr/lib/liblvm-10.so
ln -snf liblvm-10.so $RPM_BUILD_ROOT/usr/lib/liblvm.so
ln -snf liblvm-10.a $RPM_BUILD_ROOT/usr/lib/liblvm.a

%post -p /sbin/ldconfig

%postun -p /sbin/ldconfig

%clean
rm -Rf $RPM_BUILD_ROOT

%files
%defattr(-, root, root, 755)
%doc ABSTRACT CHANGELOG CONTRIBUTORS FAQ
%doc INSTALL KNOWN_BUGS LVM-HOWTO README TODO WHATSNEW
%doc PATCHES
/%{_libdir}/liblvm-10.so.CVS.CVS
/%{_sbindir}/e2fsadm
/%{_sbindir}/lv*
/%{_sbindir}/pv*
/%{_sbindir}/vg*
/usr/lib/liblvm*.a
/usr/lib/liblvm*.so
/%{_mandir}/man8/e2fsadm.8*
/%{_mandir}/man8/lv*.8*
/%{_mandir}/man8/pv*.8*
/%{_mandir}/man8/vg*.8*

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
