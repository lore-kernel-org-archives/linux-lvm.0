Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iA7JDNbM002705
	for <linux-lvm@redhat.com>; Sun, 7 Nov 2004 19:13:23 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CQsTb-0005QS-Sx
	for linux-lvm@redhat.com; Sun, 07 Nov 2004 19:13:23 +0000
Date: Sun, 7 Nov 2004 19:13:23 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Creating PV over a /dev/mapper device /
Message-ID: <20041107191323.GE2717@agk.surrey.redhat.com>
References: <tk9so0di0jsl44dagc1dl8at6e9ld4r1be@4ax.com>
	<mhcso057hatf6psfl54vqqe0qtqpgrj7p8@4ax.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhcso057hatf6psfl54vqqe0qtqpgrj7p8@4ax.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Nov 07, 2004 at 03:36:54PM +0100, Roman Medina-Heigl Hernandez wrote:
>   Internal error: unknown device-mapper task 16

Suggests that your 'lvm' binary is newer than your device-mapper
library.  If that's pure Debian, it suggests there's a package
version dependency missing.  I'll see about changing that out-dated 
error message.

(It should be harmless though and still work OK, skipping the
new checks.)

Alasdair
-- 
agk@redhat.com
