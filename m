Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j33Jg7pH011442
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2005 20:42:07 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DIAz1-0000hj-Sy
	for linux-lvm@redhat.com; Sun, 03 Apr 2005 20:42:07 +0100
Date: Sun, 3 Apr 2005 20:42:07 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] [PATCH] --ignorelockingfailure for `lvm mkvgnodes`
Message-ID: <20050403194207.GQ14307@agk.surrey.redhat.com>
References: <20050403104158.GA6712@irc.pl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050403104158.GA6712@irc.pl>
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

On Sun, Apr 03, 2005 at 12:41:58PM +0200, Tomasz Torcz wrote:
>  `lvm vgmknodes` needs --ignorevglocking

Agreed - though for different reasons (I won't go into here).

'vgscan --mknodes --ignorelockingfailure' is normally adequate, and looks 
to be so in your case?

Alasdair
-- 
agk@redhat.com
