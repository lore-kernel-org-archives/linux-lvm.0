Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2NGUm4D012596
	for <linux-lvm@redhat.com>; Thu, 23 Mar 2006 11:30:48 -0500
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.193])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2NGUgQr023173
	for <linux-lvm@redhat.com>; Thu, 23 Mar 2006 11:30:42 -0500
Received: by zproxy.gmail.com with SMTP id 8so508551nzo
	for <linux-lvm@redhat.com>; Thu, 23 Mar 2006 08:30:42 -0800 (PST)
Message-ID: <170fa0d20603230829n50943ffcr716d480e7a4b3beb@mail.gmail.com>
Date: Thu, 23 Mar 2006 11:29:11 -0500
From: "Mike Snitzer" <snitzer@gmail.com>
Subject: Re: [linux-lvm] snapshots filling and hanging up processes
In-Reply-To: <20060321192427.GO26428@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <1142966004.18275.35.camel@pc>
	<20060321192427.GO26428@agk.surrey.redhat.com>
Content-Transfer-Encoding: 8bit
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

On 3/21/06, Alasdair G Kergon <agk@redhat.com> wrote:
> On Tue, Mar 21, 2006 at 01:33:24PM -0500, Brian J. Murrell wrote:
> > later FC kernel like kernel-2.6.15-1.1833_FC4.x86_64.rpm  or
> > kernel-2.6.15-1.2054_FC5.x86_64.rpm?
>
> Relevant kernel patches should be going into 2.6.17.
>
> Or download from
>   http://www.kernel.org/pub/linux/kernel/people/agk/patches/2.6/editing/

Have these patches gone in to the RHEL4 U3 kernel?  Is RHEL4 U3's lvm
snapshot support considered "officially supported by RedHat"?

Thanks for all your hard work on lvm snapshot!
Mike
