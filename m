Return-Path: <james@fr.clara.net>
Date: Fri, 2 Feb 2001 16:08:49 +0100 (CET)
From: JAmes <james@fr.clara.net>
Message-ID: <Pine.LNX.4.21.0102012054480.1092-100000@munster.noc.fr.clara.net>
MIME-Version: 1.0
Subject: [linux-lvm] newbie question
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Another question I have is can anybody show me a good install plan, a
partition scheme for a machine where everything but the / is lvm'ed. I
haven't seen this discussed anywhere. At the moment I am just testing on a
box with a partition / a swap and a /home .

If I did a standard installation using say 5 partitions / /usr /var/ /home
swap, it would be a pain transferring this to an lvm system. So how do you
lot do it ? WHat sort of installation do you do?

my partitions at the moment

 Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1       608   4883728+  83  Linux
/dev/hda2           609       627    152617+  82  Linux swap
/dev/hda3           628       749    979965   83  Linux
/dev/hda4           750      1601   6843690    5  Extended
/dev/hda5           750       871    979933+  8e  Linux LVM
/dev/hda6           872       993    979933+  8e  Linux LVM
/dev/hda7           994      1601   4883728+  8e  Linux LVM

Thanks again.
