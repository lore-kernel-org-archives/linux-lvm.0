Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3CIodIq010021
	for <linux-lvm@redhat.com>; Mon, 12 Apr 2010 14:50:39 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.158])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3CIoTb8032388
	for <linux-lvm@redhat.com>; Mon, 12 Apr 2010 14:50:30 -0400
Received: by fg-out-1718.google.com with SMTP id d23so427585fga.9
	for <linux-lvm@redhat.com>; Mon, 12 Apr 2010 11:50:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4BC34F78.8040301@cfl.rr.com>
References: <OF75144135.FA049A9C-ON48257703.00588F0C-48257703.00593B92@db.com>
	<4BC34F78.8040301@cfl.rr.com>
Date: Mon, 12 Apr 2010 19:50:28 +0100
Message-ID: <o2w3a0a09d21004121150hda2358dbx88800821b04bf39f@mail.gmail.com>
From: Robert Mortimer <robert.mortimer@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] How do I properly backup and restore / on LVM2
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

On 12 April 2010 17:51, Phillip Susi <psusi@cfl.rr.com> wrote:
> On 4/12/2010 12:14 PM, Alan Pek wrote:
>>
>> Hi Folks,
>>
>> How do I properly backup and restore / on LVM2 , e.g.
>
> The same way you would without LVM2. �Perhaps tar or dump? �If you use
> dump then lvm allows you to make a snapshot and back that up instead so
> you don't have to boot to single user mode and remount ro.
>

I take a snapshot and then use rdiff-backup to get a D-2-D backup. It
works well for me and has been used once or twice. We also run a month
end tape backup using Yosemite backup http://www.barracudaware.com/

you can run the rdiff over SSH using pre-exchanged keys for off site
backup. There are also some Amazon cloud based solutions but don't
expect you data to come back in a flash (best used as a fall back in
case of the building burning down).

In short the LVM is not the important part (unless you need the
snapshot) the main things are

Qty of data
Format of backup
On-site or Off-site
Incremental of Full
Acceptable recovery time
Down time during backup
Performance during backup
And all the normal stuff

Rob Mortimer




> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
