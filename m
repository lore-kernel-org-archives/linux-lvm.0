Received: from dogpound.rdu.redhat.com (dogpound.rdu.redhat.com [172.16.59.2])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id jBN65LrW019187
	for <linux-lvm@redhat.com>; Fri, 23 Dec 2005 01:05:21 -0500
Date: Fri, 23 Dec 2005 00:54:20 -0500
From: Josef Whiter <jwhiter@redhat.com>
Subject: Re: [linux-lvm] a question about lvm in linux
Message-ID: <20051223055420.GA1919@dogpound.rdu.redhat.com>
References: <20051222131023.2E6280035DF3@relay.vip.sohu.com>
	<20051222212231.GA30568@dogpound.rdu.redhat.com>
	<1135302583.2031.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1135302583.2031.5.camel@localhost.localdomain>
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

Hello,

You will want to make sure you logged in as root, or used

su -

and try it.  If it still doesnt work run the command

up2date e2fsprogs

this provides the resize2fs utility.  Thank you,

Josef

On Fri, Dec 23, 2005 at 09:49:44AM +0800, alexli wrote:
> hello, Mr White. i am sorry for disturb you again , today i try the
> command --- resize2fs on the system :redhat linux as4 , but i find that
> the system shows me a message telling that there is not such a command.
> can you help me? 
