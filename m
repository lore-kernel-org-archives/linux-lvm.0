content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB01258AA4@mercury.infiniconsys.com>
From: "Barry, Christopher" <cbarry@infiniconsys.com>
Subject: [linux-lvm] creating patches problem
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
Date: Mon Mar 10 16:50:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Lvm (E-mail)" <linux-lvm@sistina.com>

Hi all,
	I guess I'm just not getting it.=20

	I downloaded device-mapper-latest, which turns out to be 0.96.07. I =
extract it into /usr/src/. From the LVM-HowTo, it says to run =
./configure from the extracted root, and then enter the patches =
directory and run make.=20

(I did this because the LVM2.1.95.15 directory did not have a patches =
directory)=20

	The LVM HowTo seems a bit out of date.=20
http://tldp.org/HOWTO/LVM-HOWTO/buildlvmpatch.html
After ./configure, there is no Makefile in patches, so this does not =
work. I also downloaded LVM2.0-latest, which in this case is 2.1.95.15. =
I ran ./configure in that root as well, thinking it might build a =
patches directory. nada.

Basically, I'm having a hell of time creating the device-mapper patches =
for the 2.4.20 kernel. I read the INSTALL file, I've attempted to run =
'make patches' in it's kernel subdir out of desperation, but this fails =
with:

if [ ! -e /usr/src/linux-2.4.20.tar ] ; then \
    echo "Can't find kernel source tarball /usr/src/linux-2.4.20.tar" ; =
\
    exit 1; \
fi
if [ ! -e /tmp/kerndiff ] ; then mkdir /tmp/kerndiff; fi
if [ ! -d /tmp/kerndiff ] ; then \
    echo "Working directory /tmp/kerndiff missing" ; \
    exit 1; \
fi
( \
    cd /tmp/kerndiff; \
    tar xf /usr/src/linux-2.4.20.tar ; \
    cp -al linux linux-2.4.20 ; \
)
cp: cannot stat `linux': No such file or directory
make: *** [patches] Error 1
debian:/usr/src/device-mapper.0.96.07/kernel#


The symlinks get created in the 2.4.20 source tree, but a make =
menuconfig does not show the device-mapper option in the RAID / LVM =
section.


What am I doing wrong? I suppose I've hosed the whole damn thing at this =
point, and should re-extract all relevant source trees. Please advise =
and or point me to some docs if you can.


Thank You,


--
Christopher Barry
