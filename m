Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pA8IGwUB009875
	for <linux-lvm@redhat.com>; Tue, 8 Nov 2011 13:16:58 -0500
Received: from q7.q7.com (q7.q7.com [69.168.48.248])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA8IGsF1022170
	for <linux-lvm@redhat.com>; Tue, 8 Nov 2011 13:16:56 -0500
Received: from charon.spiretech.com (charon.spiretech.com [69.168.63.193])
	(authenticated bits=0)
	by q7.q7.com (8.13.8/8.13.8) with ESMTP id pA8IGl9w001735
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 8 Nov 2011 10:16:53 -0800
Message-ID: <4EB9720F.1030709@q7.com>
Date: Tue, 08 Nov 2011 10:16:47 -0800
From: Joe Pruett <joey@q7.com>
MIME-Version: 1.0
References: <915936479.2003418.1320775251420.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
In-Reply-To: <915936479.2003418.1320775251420.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Cannot unmount logical volume to reduce it
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

when you use the rescue disk, you need to tell it to skip the mounting
of the drives.  and i hope you know that you need to shrink the file
system first before you reduce the lv.  i don't know if the appropriate
tools will be available on the rescue disk without mounting the main
system drive, though.  using a livecd might be needed.

On 11/08/2011 10:00 AM, Dan White wrote:
> RHEL5.7 x86_64
> I want to reduce the size of the logical volumes on a server.
> The two giving me trouble are mounted on /var and /usr
>
> I cannot unmount them to reduce them.  Even tried booting into a rescue disc.
>
> Any suggestions ?
>
> “Sometimes I think the surest sign that intelligent life exists elsewhere in the universe is that none of it has tried to contact us.”
> Bill Waterson (Calvin & Hobbes)
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
