From: Gingia <gingiabios@email.it>
Subject: Re: [linux-lvm] vgcfgrestore and bootstrap
References: <200309231754.20420.gingiabios@email.it> <200309241414.47229.gingiabios@email.it> <20030924144818.D2618@sistina.com>
In-Reply-To: <20030924144818.D2618@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200309251127.33318.gingiabios@email.it>
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
Date: Thu Sep 25 04:36:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Alle 14:48, mercoled=EC 24 settembre 2003, Heinz J . Mauelshagen ha scrit=
to:
> > vgscan -- "/etc/lvmtab" and  "7etc/lvmtab.d" successfully created
> > vgscan -- WARNING: this programm doe not do a VGDA backup of your gro=
up
>
> Can you send the "vgscan -d" output of this case to me directly, please
> (mge@sistina.com) ?
> Probably some i2o devices scanning flaw.
I tried to make a backup with=20
vgcfgbackup command but it failed and the output was :
vgcfgbackup -- ERROR: VGDA in kernel and lvmtab are NOT consistent; pleas=
e run=20
vgscan

Can i solve this?
How i can solve the problem of bootstrap? If possible?
