Message-ID: <3B97B21D.10309@st-peter.stw.uni-erlangen.de>
Date: Thu, 06 Sep 2001 19:27:57 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] PBs with LVM over software RAID ( and XFS ? ext2 reiserfs?)-2.4.7
References: <B45465FD9C23D21193E90000F8D0F3DF404FF5@mailsrv.linkvest.com> <3B95E36E.6070703@st-peter.stw.uni-erlangen.de> <20010905120549.H32553@turbolinux.com> <3B966C63.7080309@st-peter.stw.uni-erlangen.de> <20010905123211.J32553@turbolinux.com> <3B96757E.9010201@st-peter.stw.uni-erlangen.de> <20010905164626.M32553@turbolinux.com> <3B96AFC0.5010608@st-peter.stw.uni-erlangen.de>
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

Hi again
it took me some time but it's the same with 2.4.7
mke2fs and mkreiserfs segfaults and there are no OOPSes
and jfs has no problems

vanila 2.4.7 with jfs-1.0.4 and LVM-cvs from about an hour ago 
