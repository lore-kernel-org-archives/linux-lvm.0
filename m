Received: from [127.0.0.1] (sebastian-int.corp.redhat.com [172.16.52.221])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAO9TmM6030233
	for <linux-lvm@redhat.com>; Fri, 24 Nov 2006 09:29:49 GMT
Message-ID: <4566BBE7.5080609@redhat.com>
Date: Fri, 24 Nov 2006 09:31:19 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] how to extend an lvm partition?
References: <5485940d0611231801o6391e2ccmcd827c7d2f44c5a5@mail.gmail.com>
In-Reply-To: <5485940d0611231801o6391e2ccmcd827c7d2f44c5a5@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

C'est Pierre wrote:
> Hello,
> 
> I just got curious, if I migrate the data from a lun to another one
> which is bigger, with poor man's ghost such as 'dd if=sda of=sdb', how
> am I going to be able to extend the lvm partition afterwards? is this
> possible? I know I could add a new partition in the remaining space,
> pvcreate/vgextend it into the existing VG, but are there other
> alternatives?
> 
> Thanks
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Hi,

If your version of the LVM2 tools is recent enough you can use the
pvresize command to achieve this. It normally takes one argument - the
physical volume path to resize:

[root ~]# pvresize /dev/loop0
  Physical volume "/dev/loop0" changed
  1 physical volume(s) resized / 0 physical volume(s) not resized

This was added in CVS around a year ago - I think it should have made it
into releases from 2.02.00.

Without pvresize support, the easiest way to use the extra space is, as
you said, to partition it as an additional PV.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFFZrvn6YSQoMYUY94RAjjPAKDCUlGMBkCG3ShhIy48cUwPYuSDLQCfeOVI
ck5kC0LzecYyAZDBHd1Kgaw=
=K3/+
-----END PGP SIGNATURE-----
