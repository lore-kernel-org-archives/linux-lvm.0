From: Stefan Majer <stefan@x-cellent.com>
Message-Id: <1069848492.4436.15.camel@dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] multiple snapshots
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
Date: Wed Nov 26 06:10:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

Im currently working on a samba fileserver setup based on LVM2 on top of
kernel 2.4.22.

Our customer now wants to keep several snapshots (one every day) from
the main share for backup purpose. He wants to keep up to two weeks
online, that leads in 14 different snapshots for one source LV.

All of these snapshot LVs should be mountet.
The Source LV is about 1TB in Size, we have about 300Gb for snapshots
free.

Is this possible ?, did anyone else something like this before ?, how
big would the performance impact be ?

If someone can give me some hints,numbers 
all would be welcome.

greetings

Stefan Majer
