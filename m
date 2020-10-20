Date: Tue, 20 Oct 2020 18:02:52 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20201020170252.GA5698@agk-dp.fab.redhat.com>
References: <CAKxE60zw4MvD58ds-71yQdyxFkrujCm1XHNfbF=yYRqMRHF63w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKxE60zw4MvD58ds-71yQdyxFkrujCm1XHNfbF=yYRqMRHF63w@mail.gmail.com>
Subject: Re: [linux-lvm] Why does thinpool take 2*poolmetadatasize space?
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
To: Scott Moser <smoser@brickies.net>
Cc: linux-lvm@redhat.com

On Tue, Oct 20, 2020 at 12:33:41PM -0400, Scott Moser wrote:
> When I create an lvmthinpool with size S and poolmetadatasize P,
> it reduces the available freespace by S+2P. I expected that to
> be S+P. Where did the extra poolmetadatasize get used?

So that you have sufficient disk space to store a second copy of it
if you need to perform any work on the metadata in future.

Recovery operations, for example, create a recovered copy in that
'spare' space then swap to use it leaving the space used by the
original metadata as the new 'spare'.

Alasdair
