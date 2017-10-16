Date: Mon, 16 Oct 2017 13:54:29 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20171016185429.GA26267@redhat.com>
References: <DB6PR0902MB2213A3709365A8B5F151390C954B0@DB6PR0902MB2213.eurprd09.prod.outlook.com>
	<20171013144111.GA2570@redhat.com>
	<DB6PR0902MB2213F527A2A5C02317218F72954F0@DB6PR0902MB2213.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DB6PR0902MB2213F527A2A5C02317218F72954F0@DB6PR0902MB2213.eurprd09.prod.outlook.com>
Subject: Re: [linux-lvm] add_lockspace done -19
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Moshe Lazarov <Moshe.Lazarov@axxana.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Oct 16, 2017 at 06:40:17PM +0000, Moshe Lazarov wrote:
> The command "vgcreate --shared global /dev/sdb2" creates a VG that
> eventually is REMOVED with an error:

Please send me:

- the versions of lvm and sanlock you are using

- that vgcreate command with -vvvv, e.g.
  vgcreate -vvvv --shared global /dev/sdb2 2>&1 | tee vgs.log

- after the failure, the debug logs from lvmlockd and sanlock:
  lvmlockctl -d > lvmlockd.log
  sanlock log_dump > sanlock.log

Thanks
