Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lB43wJRa005298
	for <linux-lvm@redhat.com>; Mon, 3 Dec 2007 22:58:19 -0500
Received: from smtpoutwbe07.prod.mesa1.secureserver.net
	(smtpoutwbe07.prod.mesa1.secureserver.net [208.109.78.209])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id lB43vk43024167
	for <linux-lvm@redhat.com>; Mon, 3 Dec 2007 22:57:46 -0500
Date: Mon, 03 Dec 2007 20:57:40 -0700
From: Dave Scott <dave@mauidiver.com>
Subject: RE: [linux-lvm] lvm amnesia (Incorrect metadata area header checksum)
Message-ID: <20071203205740.51068ac31da99c5a25b4d9fb7ad88fd1.f901ffeae0.wbe@email.secureserver.net>
MIME-Version: 1.0
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
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks for your response, Alasdair.

But, it didn't work (unless I have the options wrong). Here's the
output:

# vgcfgrestore -v -f /etc/lvm/backup/raid5a raid5a
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
    Fixing up missing format1 size (255.89 GB) for PV /dev/md1
  Incorrect metadata area header checksum
  Restore failed.
#

--dave;

> -------- Original Message --------
> Subject: Re: [linux-lvm] lvm amnesia (Incorrect metadata area header
> checksum)
> From: Alasdair G Kergon <agk@redhat.com>
> Date: Mon, December 03, 2007 5:31 pm
> To: LVM general discussion and development <linux-lvm@redhat.com>
> 
> 
> On Mon, Dec 03, 2007 at 07:02:03PM -0700, Dave Scott wrote:
> > I have the archive file and the data. How do I get the lvm to see it
> > once again?
> 
> add a 'vgcfgrestore' after the pvcreate
>  
> Alasdair
> -- 
> agk@redhat.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
