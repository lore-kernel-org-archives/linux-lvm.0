Message-ID: <3B9A80DF.5040600@st-peter.stw.uni-erlangen.de>
Date: Sat, 08 Sep 2001 22:34:39 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvcreate is segfaulting
References: <20010908200255.33770.qmail@web13905.mail.yahoo.com>
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

>
>
>dir then a cd /usr/src/linux and a patch < p1 using
>
that's a typo i couldn't be misstaken ?

you could do

.... ; cd PATCHES ;make ; cat lvm-CVS-2.4.9.patch | patch -p1 -d 
/usr/src/linux

and what tells  " cat /proc/lvm/general " , could you attach it
