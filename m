Message-Id: <3.0.6.32.20011102140312.00806c50@mail.doorpi.net>
From: Brent Harding <bharding@doorpi.net>
Subject: RE: [linux-lvm] snapshot questions
In-Reply-To: <D880FFC9CFDBA84FA13E9B166D06A123B647FB@daedalus.kenamea.co
 m>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
Date: Fri Nov  2 13:59:01 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

The only real issue with snapshots is needing a partition reserved for it,
as you get more and more data, this gets difficult, once half the hard disk
is full, you can't copy any more. I'd say it sounds easier to just use
whatever backup program with cron to execute late at night, maybe after
midnight, depends how far backup is when a file changes, it'll get included
if it wasn't backed up yet, otherwise if you change something the system
already backed up, it gets done on the next run.
At 11:17 AM 11/2/01 -0800, you wrote:
>Kyle,
>
>I have the opposite opinion as Jesus.  File system level backups are the
>way to go.  Maybe not on Linux (because of the robustness of the
>snapshot facility), but for sure using Veritas.  See, file system level
>database backups are fast, scalable, and simple.  However, if you can
>not count on the data consistency, then I would agree with Jesus.
>
>My personal opinion (as a DBA), is that the simplest approach to backup
>and recover is best.  If you cant do the restore at 3:00am with one eye
>closed and make 0 mistakes, then it's not worth it (that why I dont use
>Oracle RMAN).  I use snapshots (Veritas/Sun) for backups of my
>production DB's.  It's really nice to not to ever worry about a backup
>window, just backup whenever!
>
>That said, I am _evaluating_ how good Linux/LVM backups are in this
>regard.  So far, it's been fine.  Also, as always, make sure you are, or
>have a good DBA around. 8-)
>
>2.5 cents.
>
>Kenny Gorman
>DBA
>Kenamea
>
>
>-----Original Message-----
>From:	Jesus Manuel NAVARRO LOPEZ
>Sent:	Fri 11/2/2001 10:52 AM
>To:	linux-lvm@sistina.com
>Cc:=09
>Subject:	Re: [linux-lvm] snapshot questions
>
>Hi, Kyle:
>
>Kyle Hayes wrote:
>>=20
>> We are considering using LVM to do database snapshots for backups.
>>=20
>
>It's so rare the case where this approach really works that it doesn't
>even deserve to be taken into consideration, so: DON'T EVER BACKUP A
>DATABASE THROUGH FILESYSTEM UTILITIES.  The database has for sure
>methods to achieve this goal: use them.
>--=20
>SALUD,
>Jes=FAs
>***
>jesus_navarro@promofinarsa.es
>***
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
>
>
>
>Attachment Converted: "c:\download\winmail2.dat"
>
