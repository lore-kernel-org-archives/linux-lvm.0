content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Question when installing LVM
Message-ID: <269ACE34F7A8744688CC03618BF3B67D0645DA13@c092ex03.na.cintas.com>
From: "Murray, Bobby" <MurrayB@cintas.com>
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
Date: Thu May 15 13:49:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

John,
Thanks for the information. I think my problem is I do not have the =
kernel- source rpm installed. Any idea where I can get it from?
thanks


-----Original Message-----
From: John DeFranco [mailto:defranco@cup.hp.com]
Sent: Thursday, May 15, 2003 12:14 PM
To: linux-lvm@sistina.com; Murray, Bobby
Subject: Re: [linux-lvm] Question when installing LVM


Hi,

If you are building a newer version of lvm from source for redhat 7.3=20
(there is one already compiled and provided as a module), you  need=20
to be sure you have the kernel-source rpm installed. Since redhat=20
uses /usr/src/linux-2.4 instead of /usr/src/linux as the kernel=20
source base you either need to create the /usr/src/linux link=20
yourself or when you run the LVM configure command use the option=20
--with-kernel_dir=3D/usr/src/linux-2.4, this is what I do.

I have had no problems with lvm on rh7.3.

On Thursday 15 May 2003 08:57, Murray, Bobby wrote:
> I installed the LVM on Redhat Linux 7.3. I am not able to display
> anything when I do a vgdisplay or lvdisplay. Nothing seems to work.
> I was trying to compile the source but the configure is failing on
> a /usr/src/src/linux not found. Redhat does not have such a file
> thats why I turned to the RPM's but they do not seem to be working
> correctly. Has anyone else experienced any problems compiling or
> using LVM? thanks in advance
>
> Bobby Murray
> Unix Administrator / AIX Certified Specialist
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

John DeFranco			Hewlett-Packard Company
john.defranco@hp.com		Availability Clusters Solution Division
phone: 408-447-7543		19111 Pruneridge Ave, M/S 4101
fax: 408-447-0056		Cupertino, CA 95014=20


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
