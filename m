Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k62EQsPZ032731
	for <linux-lvm@redhat.com>; Sun, 2 Jul 2006 10:26:54 -0400
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k62EQkO0028313
	for <linux-lvm@redhat.com>; Sun, 2 Jul 2006 10:26:47 -0400
Received: from [10.1.2.206] (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id 440E324FB0
	for <linux-lvm@redhat.com>; Sun,  2 Jul 2006 08:26:28 -0600 (MDT)
Date: Sun, 02 Jul 2006 08:26:27 -0600
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] Re:
	vgscan	--force-all-update-reread-and-take-that-kernel
Message-ID: <25F9B6E00F76C3A7164345D5@dhcp-2-206.wgops.com>
In-Reply-To: <44A2AD8C.9020300@gnome.org>
References: <44A29C60.8020709@gnome.org> <44A2AD8C.9020300@gnome.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



--On June 28, 2006 12:25:48 PM -0400 Tristan Van Berkom <tvb@gnome.org> 
wrote:

> Tristan Van Berkom wrote:
>> Hello lvm folks,
>
> Hi again...
>     seems I have found a way to make the script work, by making the
> "volume group" active throughout the whole procedure.
>
> So, before I commit that and close this book... is what I am doing
> insane ? is it crazy to go and add a new physical volume to a volume
> group that is living and breathing ? (i.e. "active" via `vgchange -ay')

Yes.  That's part of the whole point of LVM, it's operations can all be 
done online.

>
> Cheers,
>              -Tristan
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



--
"Genius might be described as a supreme capacity for getting its possessors
into trouble of all kinds."
-- Samuel Butler
