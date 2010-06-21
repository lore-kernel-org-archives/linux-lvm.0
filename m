Message-ID: <4C1F42EE.5090202@redhat.com>
Date: Mon, 21 Jun 2010 11:46:06 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <1277115228.30102.2.camel@CHP-92AF47.upcnoos.int>
In-Reply-To: <1277115228.30102.2.camel@CHP-92AF47.upcnoos.int>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] upgrade lvm2
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: jlpenneree@ncnumericable.com, LVM general discussion and development <linux-lvm@redhat.com>

On 06/21/2010 11:13 AM, PENNEREE JEAN-LOUIS wrote:
> Hi,
> 
> I would like to upgrade lvm2 version on a RHEL5 machine.

This isn't really an lvm2/device-mapper related question - your problem
appears to be just package management.

> #rpm -Uvh device-mapper-1.02.39-1.el5.x86_64.rpm
> 
> le fichier /usr/include/libdevmapper-event.h de l'installation de 
> device-mapper-1.02.39-1.el5 entre en conflit avec le fichier du paquetage 
> device-mapper-1.02.20-1.el5
> le fichier /usr/include/libdevmapper.h de l'installation de 
> device-mapper-1.02.39-1.el5 entre en conflit avec le fichier du paquetage 
> device-mapper-1.02.20-1.el5
> le fichier /usr/share/man/man8/dmsetup.8.gz de l'installation de 
> device-mapper-1.02.39-1.el5 entre en conflit avec le fichier du paquetage 
> device-mapper-1.02.20-1.el5

So the files conflict with an older version. It looks like you have an
earlier RPM (1.02.20-1.el5) built for the i386 architecture installed.

This is normal on 64-bit x86 as it is a multilib platform (it means both
32 and 64 bit applications that use the device-mapper library can be
installed and used).

E.g.:

# rpm -q --qf="%{NAME}-%{VERSION}-%{RELEASE}.%{ARCH}\n" device-mapper
device-mapper-1.02.39-1.el5.x86_64
device-mapper-1.02.39-1.el5.i386

When it comes to upgrading however you must update the packages together
in a single transaction, e.g.:

# rpm -Uvh device-mapper-1.02.39-1.el5.x86_64.rpm \
           device-mapper-1.02.39-1.el5.i386.rpm

Alternately use the distribution-supplied update tool (yum for RHEL5) to
apply updates automatically and this will resolve dependencies and pull
in any other requirements automatically.

Regards,
Bryn.
