From: Denie Andriessen <D.Andriessen@pink.nl>
Subject: Re: [linux-lvm] PV-Move fails, now at 127 Pe's...
Message-Id: <018601c1c575$2bef40b0$f707a182@gimmie.tudelft.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <Pine.LNX.4.33.0203061156070.5102-100000@blok14b.gimmie.tudelft.nl>
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
Date: Wed Mar  6 19:07:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

Yes, I know, it's late again, but that's just the burden of having a day
job..
Stiil I seem to be unable to get the volume back online/accesable still...

The volume still doesn't 'want' (?) to becognised..  PVscan sees it, vgck
does not agree to it, vgscan neither..

Short:
After the upgrade to LVM1.0.3. and before aplying the 'sig problem' patch..
we tried to do some PV moves, from then onwards it seemed no to get any
better.... SInce the reboot the volume was not accesible anymore...

Long, long, very long log on:
http://blok14b.gimmie.tudelft.nl/~denie/LVM/log.txt

Main question is, shoulld I stick to the the about 380Gb of data or reformat
and start over new ?
The data is not really 'that' improtant' as it's just what the student's
overhere (about 120 of them) can grab together from the net for internal use
only in our house only
... But still there were quite a few good things there..

Regards,
Denie Andriessen
