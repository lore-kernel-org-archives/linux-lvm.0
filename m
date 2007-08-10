Date: Fri, 10 Aug 2007 07:09:07 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20070810050907.GA10164@percy.comedia.it>
References: <46B0EAEF.6090305@cfl.rr.com>
	<20070802065012.GA28687@percy.comedia.it>
	<46B1B5E1.1050406@redhat.com> <46B251BB.1010004@cfl.rr.com>
	<20070807210359.GA2064@agk.fab.redhat.com>
	<46BA2FCC.1040001@cfl.rr.com>
	<20070808214538.GR2064@agk.fab.redhat.com>
	<46BB4E86.7090000@cfl.rr.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46BB4E86.7090000@cfl.rr.com>
Subject: [linux-lvm] Re: [dm-devel] Re: LVM on dmraid breakage
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: ataraid-list@redhat.com, device-mapper development <dm-devel@redhat.com>, linux-lvm@redhat.com

On Thu, Aug 09, 2007 at 01:27:34PM -0400, Phillip Susi wrote:
>Alasdair G Kergon wrote:
>>But I don't yet see why it didn't also open the other devices, write a 
>>warning
>>message about duplicate IDs, and do the right thing and give them
>>precedence.
>
>Why would it open the other devices?  LVM does not scan /dev/mapper/*, 
>only /dev/sd*.  Since it does not scan the /dev/mapper devices for pvs, 
>it sees no duplicates and can not "do the right thing".

LVM scans the whole /dev directory, unless you configure it otherwise.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
