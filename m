Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3235gj12451
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 22:05:42 -0500
Received: from hotmail.com (bay16-dav23.bay16.hotmail.com [65.54.186.203])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i3235ejj016186
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 22:05:41 -0500
From: "sachin" <sachindurge@hotmail.com>
Date: Fri, 2 Apr 2004 08:41:53 -0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <BAY16-DAV23dDHgb4Kb0000dc77@hotmail.com>
Subject: [linux-lvm] character device creation
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Thanks Shaun
I am quite new to linux
Can you tell  me how to identify the raw device that it is actually bind to
a logical volume
And what extra things that i needed to do if i wan to use raw devices like
driver or any thing else
 or lvm driver supports that
Thanks ,
Sachin.

Previous message :
Date: Thu, 1 Apr 2004 10:52:23 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] character device creation
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <20040401085223.GC29222@redhat.com>
Content-Type: text/plain; charset=us-ascii

On Thu, Apr 01, 2004 at 12:26:39PM -0800, sachin wrote:
> Hi
> Can i Create a character device for a logical volume of lvm
> If yes how to create and how lvm driver manage it or supports it

Yes. Have a look at 'man raw'.

> Thanks ,
> Sachin
