From: lvm@interlinx.bc.ca
Subject: Re: [linux-lvm] moving single LVM disk from one system to another
Message-ID: <20020819100456.GB13367@linux.interlinx.bc.ca>
References: <20020817070901.GA5022@linux.interlinx.bc.ca> <20020819102427.A24314@sistina.com> <20020819090226.GA13367@linux.interlinx.bc.ca>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20020819090226.GA13367@linux.interlinx.bc.ca>
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
Date: Mon Aug 19 05:05:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

OK.  To update:  it would seem that for whatever reason, devfs _is_
being mounted (cat /proc/mounts shows devfs on /dev and .devfsd is in
/dev) but there are no device nodes under
/dev/ide/host0/bus[01]/target0/.  Strange.  But that explains why
vgscan could not find the VG.

The ide devices are seen by the kernel.  /proc/ide/hd?/model shows the
disk and CD R/W devices.  /proc/partitions is empty however.  Very
strange.  I will have to dig in and figure out why this is.  All and
any theories are welcome.  :-)

But the long and short of my problem is that it's not an LVM problem.
Not directly anyway.

b.

--=20
Brian J. Murrell
