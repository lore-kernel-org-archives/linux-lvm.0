Message-Id: <3C8411EB.8020903@st-peter.stw.uni-erlangen.de>
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Migrating root problems... (svetljo)
References: <E16hphK-00042P-00@hermes.sistina.com>
    <032101c1c3d5$36ab4950$02001aac@q3x.net>
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
Date: Mon Mar  4 18:30:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

could you try this one ( in case /dev/hda1 translates in hd0,0)
title Net Hat Linux (2.4.7-10)lvm
kernel (hd0,0)/vmlinuz-2.4.7-10feb2002 mem=250M ramdisk=5038 ro 
root=/dev/q3xvol/root
initrd (hd0,0)/initrd-lvm-2.4.7-10feb2002.gz
