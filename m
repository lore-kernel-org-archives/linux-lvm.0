From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@users.sourceforge.net>
Message-ID: <yw1x4r4yfiab.fsf@zaphod.guide>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Trouble switching from LVM2 to LVM1
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
Date: Wed Apr 16 12:46:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

I decided to take linux 2.5 with devicemapper and lvm2 for a spin.
Everything lvm related worked just fine.  Now I want to boot linux
2.4.21-preX, without devicemapper.  The problem is that vgscan runs
without errors, but all the LV device nodes are created with minor 0.
This way they all point to the same LV.  That is not what I want.  Is
there any way to get them back, or am I stuck with device-mapper?

--=20
M=E5ns Rullg=E5rd
mru@users.sf.net
