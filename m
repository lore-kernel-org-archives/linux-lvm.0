Message-Id: <3C840F31.4040901@st-peter.stw.uni-erlangen.de>
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and swap
References: <3C840AED.7AE477E7@ardynet.com>
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
Date: Mon Mar  4 18:19:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


R Dicaire wrote:

>I have a swap partiton on each of three disks. Is it a good idea to
>create a logical volume utilizing these three partitions, and make
>one swap volume, say even striping it across all three disks?
>
>Thoughts/suggestions?
>
/dev/hde9 swap swap defaults,pri=1 0 0
/dev/hdh9 swap swap defaults,pri=1 0 0
/dev/hdg11 swap swap defaults,pri=1 0 0

that do the same, but without the overhead of useing lvm or raid
