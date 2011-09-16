Message-ID: <4E733876.70501@redhat.com>
Date: Fri, 16 Sep 2011 13:52:22 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <CAPbm57VXFxPNgGwh-sNZcgBqq4HDFTg2H_uAMdsnR+xYQ14Cfw@mail.gmail.com>
In-Reply-To: <CAPbm57VXFxPNgGwh-sNZcgBqq4HDFTg2H_uAMdsnR+xYQ14Cfw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] can't make snapshot
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
To: Joseph Graham <t67t67t67@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 09/16/2011 12:41 PM +0100, Joseph Graham wrote:
> lvcreate --size 100M --snapshot --name root_snap /dev/VolGroup00/root
> -vvv 2> outfile
> 
> http://ompldr.org/vYWRqbg/outfile

See also https://bugzilla.redhat.com/show_bug.cgi?id=727925#c11

Peter
