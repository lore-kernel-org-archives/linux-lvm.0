Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lAQFNaEI005008
	for <linux-lvm@redhat.com>; Mon, 26 Nov 2007 10:23:36 -0500
Received: from smtp2.lsm.gtwy.uscourts.gov (smtp2.lsm.gtwy.uscourts.gov
	[208.27.203.95])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lAQFN4Cb011710
	for <linux-lvm@redhat.com>; Mon, 26 Nov 2007 10:23:04 -0500
In-Reply-To: <200711252112.31500.benscott@nwlink.com>
Subject: Re: [linux-lvm] lvm library progress?
Message-ID: <OF60D38B0F.C8C5B29D-ON8625739F.0052A9A0-8625739F.00547FCF@uscmail.uscourts.gov>
From: Greg_Swift@aotx.uscourts.gov
Date: Mon, 26 Nov 2007 09:22:58 -0600
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

The python library I was working on has only gotten so far.  It does still
rely on the lvm commands, at this point *display gathers information. Due
to the lack of response from people here and my OCD oriented tendancies to
have it be "right" I've actually only ended up implementing very basic
functionality.  Right now you can gather information about a pv, vg, or lv.
You can run vgcfgbackup, and then you can restore a pv referencing that
file, and you can restore a vg and its lvs with the vgcfgrestore command.
It also imports data from an XML utility a co-worker wrote so that in a
restore environment you can populate the objects without being able to pull
their info from the system. (effectively pickling the data, but with xml).

The template for the other functions is there and easy to populate, and the
display function might need to be migrated from *display to *s.
Unfortunately I got little feed back so this is as far as I've gotten since
its all i have to have for the application I'm writing.  Long-term I'd like
to see a more complete module, but I would need a more detailed
understanding of LVM, imo, to do that.  And while I keep reading up, I
don't know how detailed of an understanding I will ever really have.

-greg

linux-lvm-bounces@redhat.com wrote on 11/25/2007 11:12:31 PM:

> I saw a recent reference on this list to the development  of a
> library for lvm
> functions. Is this at a point where it could be used for anything useful?
I
> have written a program that calls the lvm programs directly but would
prefer
> to use a library if possible. Even if only some functions are done that
might
> still be helpful.
>
> Thank you.
> Ben Scott
> benscott@nwlink.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
