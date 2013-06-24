Date: Mon, 24 Jun 2013 20:07:20 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130624190720.GA27846@agk-dp.fab.redhat.com>
References: <33AB1F690A60294389CCA50E2EFEE6C22571C934@MILMBXIP02.sdcorp.global.sandisk.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33AB1F690A60294389CCA50E2EFEE6C22571C934@MILMBXIP02.sdcorp.global.sandisk.com>
Subject: Re: [linux-lvm] pvcreate ignores volumes with error code:253
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
To: Abhilash Nag <Abhilash.Nag@sandisk.com>
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

On Tue, Jun 18, 2013 at 06:34:42PM +0000, Abhilash Nag wrote:
> I am trying to create LVM on my drives, but pvcreate -vvv throws up an error message saying: fails with an error message:/dev/hd*: Skipping: Unrecognised LVM device type 253.
> I am trying to debug if this is a device driver problem or if LVM does not recognize the entry of a previously unknown device.

Obtain the following:
# lvm version
# lvm dumpconfig devices
# cat /proc/devices

253 in the block section of /proc/devices points to a word that should be either
built in or appearing in the dumpconfig output.

Alasdair
