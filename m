Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1K7R4i17722
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2004 02:27:04 -0500
Received: from p15107633.pureserver.info (daemon@perlnuke.info [217.160.141.122])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1K7R3b08132
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2004 02:27:03 -0500
From: Matthias Albert <matthias@ma-c.de>
Message-Id: <1077262021.885.3.camel@fragger>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] ext3 lvm Problem
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Feb 23 08:41:13 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hallo zusammen,

ich hab hier ein Raid 5 mit ext3 in einem lvm am laufen. Leider hab ich
damit nur Probleme. (Produktionsserver nat�rlich noch)

EXT3-fs error (device lvm(58,6)): ext3_readdir: directory #7569548
contains a
hole at offset 0
ttempt to access beyond end of device
Feb 19 06:26:45 bart kernel: 3a:06: rw=0, want=150290744,
limit=115343360
Feb 19 06:26:45 bart kernel: EXT3-fs error (device lvm(58,6)):
ext3_readdir: directory #7569548 contains a
hole at offset 4096

usw. Von diesen Fehlern hagelt es dann die Mbyte Weise in der syslog.

Das ganze wirkt sich so aus dass in manchen Verzeichnisse Files sind die
�ber 50 Terrabyte gross und von 1932 z.b. sind.

Ich hab mein Problem in die debian-user-german Mailingliste gepackt ->
dort wurde ich darauf hingewiesen dass es wohl ein Problem mit ext3 und
lvm ist und ich das ganze hier mal posten soll.

Gibt es daf�r mittlerweile einen Patch? Wenn ja wo find ich den, wenn
nein wann wird einer kommen. Ist das Problem �berhaupt schon bekannt?

Viele Gr�sse aus Karlsruhe,

Matthias
