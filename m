Message-ID: <3BA06580.4040104@st-peter.stw.uni-erlangen.de>
Date: Thu, 13 Sep 2001 09:51:28 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM
References: <20010912160743.5D20E4326@oscar.casa.dyndns.org> <NBBBJHKIOKPKOGOEPEDPMEDPDNAA.stuart@bh90210.net> <20010912172102.B1541@turbolinux.com>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Mandrake 8 use lilo 21.7 - it should be working

Andreas Dilger wrote:

>On Sep 12, 2001  15:41 -0700, IT3 Stuart B. Tener, USNR-R wrote:
>
>>	I am curious what version of lilo in fact supports ReiserFS tails. I am running Mandrake 8.0, and using the lilo supplied therewith, and have been booting a / partition as ReiserFS (with tails I believe, how do I check?).
>>
>
>At least version 21.6+ support reiserfs tails (maybe earlier, I don't know).
>You should be able to verify with "strings /sbin/lilo | grep -i reiserfs".
>What it does is unpack the tail on any kernel/initrd files so that LILO
>can map the blocks directly.  In a way, it is strange that this is needed,
>since I thought tails only applied to files < 64kB or similar...
>
>Cheers, Andreas
>
