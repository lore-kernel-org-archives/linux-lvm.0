From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Message-ID: <20011123002839.A806@sky.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] How to remove a vg manually?
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
Date: Thu Nov 22 17:25:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hey,
first I wanna say, the resize of the reiserfs worked ok. Thanks.

I move my hole data from the old vg01 with that error
"pvmove -- ERROR reading input physical volume "/dev/hdb1" (still 65536 byt=
es to read)"

to the new vg store at the moment. If it=B4s done I would like to remove
the old vg01.
How can I do this? Delete all files /etc/lvmconf/vg01* and change all
Partition Types tp 83 instead of 8e?

Anything else or another possibility?

Thanks
Uli

--=20
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
