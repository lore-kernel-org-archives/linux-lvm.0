From: RoMaNSoFt <r0man@phreaker.net>
Message-ID: <3l1hpu8qulpm0f5phatapq8mhgs43psi07@4ax.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Performance measures with LVM. Idem with LVM & RAID (linux)
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
Date: Mon Sep 30 12:16:38 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

 Hi,

 I guess this question should be a faq but I haven't found any recent
document/paper explaining the performance penalties implied by a
typical small-scenario LVM installation.

 In particular I have a SuSE 8 linux in a 1 GHz processor box, with a
13 gb "normal" ide disk. I have another hd that, if necessary, I will
use in a future to expand partitions. So I had thought of using LVM
(scalability purposes). But before installing it, I'd like to have a
look to any recent paper/doc/article talking about the performance of
LVM. Beside this, I'd also like to know about the performance of a LVM
over (software-) RAID system. Is there any kind of comparative or
benchmarking about typical IDE systems with LVM (recent version) (and
with/without RAID)?

 Ups, I forgot it: I'm always refering to LVM in linear mode
(non-stripped mode), with each disk containing one PV.

 Summarizing:
 Which % of penalty will I suffer if I install LVM? Which kind of
operations would be more affected? I read about 1% penalty and "dd"
operations being the worst cases. Could you confirm it?

 Thanks in advance and sorry if this is a faq...

 Salu2,
 --Roman

--
PGP Fingerprint:
09BB EFCD 21ED 4E79 25FB  29E1 E47F 8A7D EAD5 6742
[Key ID: 0xEAD56742. Available at KeyServ]
