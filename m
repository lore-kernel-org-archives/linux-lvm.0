Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7BIC01j001520
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 14:12:00 -0400
Received: from exchange2k.lims.com (exchange2k.lims.com [65.119.219.231])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7BIBmZA008651
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 14:11:49 -0400
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C6BD71.99CCC3C0"
Subject: RE: Re: [linux-lvm] LVM2 on hardware RAID
Date: Fri, 11 Aug 2006 14:11:43 -0400
Message-ID: <73A8ABE78537AE4E9DB1D70863B8275F0330CD7E@exchange2k.lims.com>
From: "Musil, William" <wmusil@labvantage.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C6BD71.99CCC3C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks for the reply.=20

I would intend to do it offline. Not sure what you mean by dd in a =
shell.
Could you elaborate?=20

Do you mean, make a backup, drop and recreate the pv, vg, lv, and
filesystems, and recover backup?
I was hoping not to have to do this, kinda defeats the purpose.
I was trying to get away with managing all of my filesystems within lvm =
as
LV's, trying to keep the pv's as simple as possible.


William T. Musil
Manager, Technical Services

LabVantage Solutions, Inc.
1160 US Highway 22 East, Bridgewater, NJ 08807
p| 908.333.0111
f | 908.707.1179=20
e| wmusil@labvantage.com
i | www.labvantage.com

The information in this e-mail is confidential and may contain legally
privileged information. It is intended solely for the person or entity =
to
which it is addressed. Access to this e-mail by anyone else is =
unauthorized.
If you are not the intended recipient, any disclosure, copying, =
distribution,
action taken, or action omitted to be taken in reliance on it, is =
prohibited
and may be unlawful. If you received this e-mail in error, please =
contact the
sender and delete the material from any computer.



-----Original Message-----
From: linux-lvm-bounces@redhat.com
[mailto:linux-lvm-bounces@redhat.com]On Behalf Of paddy
Sent: Friday, August 11, 2006 1:25 PM
To: linux-lvm@redhat.com
Subject: Re: [linux-lvm] LVM2 on hardware RAID


On Fri, Aug 11, 2006 at 12:48:42PM -0400, Musil, William wrote:
> Hello all.
>=20
> I have an issue, that I am not sure how to address.
>=20
> How can I resize the physical volume if I change the geometry of the =
disk
> (non-destructive resize of RAID volume at the hardware level)=20
> I can see that the OS has picked up the new size of the disk and I =
would
like
> to resize the existing pv. I don't know how.
>=20
> I started with a hardware raid 5 (400GB), linux automatically =
recognizes
disk
> as /dev/sdb
>=20
> a simplistic representation of the setup is as follows
>=20
> pvcreate /dev/sdb
> vgcreate VolGroup10 /dev/sdb
> lvcreate -n LogVol10 VolGroup10
> mkfs.ext3 /dev/mapper/VolGroup10-LogVol10
>=20
> I have added a disk and expand the array to 600GB I can still see =
every
thing
> but I don't know how to extend the PV.
>=20
> filesystems OK
> logical volumes OK
> volume groups OK
>=20
> linux sees /dev/sdb as 600GB
> pvs shows pv /dev/sdb is 400GB. I wish to, non-destructively, =
reinitialize
> /dev/sdb so that pvs shows 600GB. how?

online or offline ?

I'm not aware of any tool that will resize your PV online.  I can't
immediately
think that it would be hugely difficult, but it's a piece of work :-)

as for offline, you could do that in an afternoon with shell and dd :-)

Other possible strategies include, having partitioned your raid in the =
first
place (yes I know this is silly, but you can see what I mean), or =
perhaps
converting to some other VM software that can do what you need (like, =
will
EVMS do this??)  Perhaps there is a way to emulate the 'having =
partitioned
first strategy' and make the new 200G addressable as a seperate block
device, at which point a pvmerge command would come in handy :-)
(of course that would be easier if the PEs were PE size aligned to the
underlying device, but you could take account of that in where you=20
started your new PV :-)

Or perhaps some kind soul will point you to something I have missed.

Good Luck.

Regards,
Paddy
--=20
Perl 6 will give you the big knob. -- Larry Wall

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

------_=_NextPart_001_01C6BD71.99CCC3C0
Content-Type: text/x-vcard;
	name="Musil, William.vcf"
Content-Transfer-Encoding: base64
Content-Description: Musil, William.vcf
Content-Disposition: attachment;
	filename="Musil, William.vcf"

QkVHSU46VkNBUkQNClZFUlNJT046Mi4xDQpOOk11c2lsO1dpbGxpYW0NCkZOOk11c2lsLCBXaWxs
aWFtDQpBRFI7V09SSzo7QnJpZGdld2F0ZXINCkxBQkVMO1dPUks6QnJpZGdld2F0ZXINCkVNQUlM
O1BSRUY7SU5URVJORVQ6V011c2lsQGxhYnZhbnRhZ2UuY29tDQpSRVY6MjAwNDAzMDNUMTg1MjI0
Wg0KRU5EOlZDQVJEDQo=

------_=_NextPart_001_01C6BD71.99CCC3C0--
