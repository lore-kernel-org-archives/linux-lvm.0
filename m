Date: Tue, 16 Oct 2001 09:45:39 -0700
From: Mark <mark@transvirtual.com>
Subject: Re: [linux-lvm] added a physical volume but df reports no joy
Message-ID: <20011016094539.F24088@transvirtual.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011016023755.E28004@jadzia.josv.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

ah! yes i realized this this morning!

i'll get that backup started and look at the doc on xfs_growfs.

cheers!

<m>

On Tue, Oct 16, 2001 at 02:37:55AM +0200, Jos Visser wrote:
.Hi Mark,
.
.After doing an lvxtend, you must also resize the filesystem that resides
.in the LV. With an ext2fs, this can be achieved using the resize2fs tool
.that is part of the latest ext2fs tools. Be sure to read the manual page
.carefully, and maybe even backup your valuable data first!
.
.++Jos
.
.And thus it came to pass that Mark wrote:
.(on Mon, Oct 15, 2001 at 05:31:54PM -0700 to be exact)
.
-- 
  Mark Garey                            Tel:     (415) 243-4055 x1023
  Transvirtual Technologies, Inc.,      Fax:     (415) 243-4056
  San Francisco, CA. USA                Email:   mark@transvirtual.com
  Fingerprint = OHMY GODC COMP UTER SHAV ETAK ENOV ERMY LIFE
