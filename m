From: "Dale Gallagher" <foobar@mighty.co.za>
Message-ID: <web-216233373@mail01.infosat.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM2 + Linux 2.6.1 questions
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
Date: Mon Jan 26 10:06:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi there

I've successfully setup LVM2.2.00.08 and
device-mapper.1.00.07 on a Slackware 9.1 host with Linux
2.6.1.  I have a question or two:

1) Would a shutdown error something like the following, be
attributed to LVM and/or device-mapper?

/proc/devices: fopen failed - no such file or directory

2) Why do I see, for example, a /dev/mapper/v01-home entry,
instead of /dev/v01/home, when running 'df' and 'mount'?  I
see that /dev/mapper/v01/home symlinks to
/dev/mapper/v01-home, which must account for this, though I
thought that because I'd specified /dev/v01/home, that it'd
appear as such?  Not that this really matters I suppose ;-)

$ df -h | grep v01
/dev/mapper/v01-home  2.9G  444M  2.4G  16% /home
/dev/mapper/v01-usr   2.0G  1.1G  760M  60% /usr
/dev/mapper/v01-var   985M   30M  906M   4% /var

$ mount | grep v01
/dev/mapper/v01-home on /home type ext3 (rw)
/dev/mapper/v01-usr on /usr type ext3 (rw)
/dev/mapper/v01-var on /var type ext3 (rw)

3) Does anyone know when LVM2 specific docs, such as a
HOWTO and FAQ will be available?

Thanks
Dale
