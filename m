Message-ID: <3B966C63.7080309@st-peter.stw.uni-erlangen.de>
Date: Wed, 05 Sep 2001 20:18:11 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] PBs with LVM over software RAID ( and XFS ? ext2 reiserfs?)
References: <B45465FD9C23D21193E90000F8D0F3DF404FF5@mailsrv.linkvest.com> <3B95E36E.6070703@st-peter.stw.uni-erlangen.de> <20010905120549.H32553@turbolinux.com>
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

and what should i try now
i was writing to Nail Brown about the XFS mount problem  but i think he 
stop writing to me
after i couldn't recreate the problem

which kernel should i test 2.4.5 2.4.6 2.4.7

Andreas Dilger wrote:

>On Sep 05, 2001  10:33 +0200, svetljo wrote:
>
>>some ideas whom should i write to and what else should i try
>>i've already written to the developers of e2fsprogs and to Hans Reiser
>>but i still don't have a reply( it was 2-3 days ago) and mr Hans Reiser 
>>wonts $25 for looking at a problem
>>
>
>I don't think it has anything to do with e2fsprogs or reiserfs.  The
>problem is clearly in LVM, MD, or the block layer.  Thousands of people
>are using both e2fsprogs and reiserfsprogs, and if they had such problems
>more people would know about it.
>
>Cheers, Andreas
>
