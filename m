Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s06LBQU5009152
	for <linux-lvm@redhat.com>; Mon, 6 Jan 2014 16:11:26 -0500
Received: from homiemail-a42.g.dreamhost.com (caibbdcaabib.dreamhost.com
	[208.113.200.181])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s06LBPrQ006394
	for <linux-lvm@redhat.com>; Mon, 6 Jan 2014 16:11:25 -0500
Received: from homiemail-a42.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a42.g.dreamhost.com (Postfix) with ESMTP id 36B5168C05F
	for <linux-lvm@redhat.com>; Mon,  6 Jan 2014 13:11:25 -0800 (PST)
Received: from [127.0.0.1] (unknown [159.63.145.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tanstaafl@libertytrek.org)
	by homiemail-a42.g.dreamhost.com (Postfix) with ESMTPSA id 0BA3E68C058
	for <linux-lvm@redhat.com>; Mon,  6 Jan 2014 13:11:24 -0800 (PST)
Message-ID: <52CB1BDE.5030907@libertytrek.org>
Date: Mon, 06 Jan 2014 16:10:54 -0500
From: Tanstaafl <tanstaafl@libertytrek.org>
MIME-Version: 1.0
References: <52C16F30.9090501@libertytrek.org>	<52CAA89E.1000904@libertytrek.org>
	<52CADC82.60607@gmail.com>
In-Reply-To: <52CADC82.60607@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Question re: deleting an LV...
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 2014-01-06 11:40 AM, Guy Rouillier <guy.rouillier@gmail.com> wrote:
> I learned via this mailing list that lvremove just updates metadata to
> make the space available again, but doesn't remove the filesystem in the
> LV.  So if you were to recreate the exact same LV you just removed, the
> filesystem would still be there.  My situation was unusual, and you
> probably won't encounter this.  But if you want to avoid that minor
> possibility, use "wipefs -a /dev/vg/snaps" before lvremove.

Thanks for the reply Guy...

I don't think this is necessary, as this space

  a) never had anything written to it, and

  b) will be used for LVM snapshots, so even if it had, it would get
     overwritten very soon.

Anyway, thanks... looking forward to getting my email rsnapshot backups 
working using LVM snapshots (for consistency - no more 'file vanished' 
messages during backups)...

Thx again

Charles
