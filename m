Subject: Re: [linux-lvm] read-only media in a LVM?
Message-ID: <3926-58764@sneakemail.com>
References: <C42D120999B1CC4C886B6BB2832F356019BF8D@hermes.genomatica.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C42D120999B1CC4C886B6BB2832F356019BF8D@hermes.genomatica.com>
From: "Wolfgang Weisselberg" <uzx87lvfmukwc001@sneakemail.com>
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
Date: Mon Jun 23 16:23:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Sean P. Kane wrote 36 lines:

> Does a snapshot create a copy of all the files in memory?

Nope.  And not in memory either.

> Just the files that changed?

Nope, LVM is filesystem-agnostic, and that would have to change
that.  More code, more errors, less usability.

Additionally, what would you do with metadata, like used
filesystem blocks and timestamps and filenames?

Or with a 1 TB file where just 1 bit was changed?

> Or just the file blocks or contents (i.e. diffs) that have
> changed?

Blocks of (default) 32Kb of raw disk.  They are written to the
snapshot.  However, the tables of which blocks were written are
kept in RAM, so a read request on the snapshot redirects only the
unchanged blocks to the original (HD/CD) and gets the changed
blocks out of the snapshot storage.

> So, would the snapshot have to be the same size as the cdrom or
> could it be smaller?

MUCH smaller. Unless you insist on changing something in every
32KB block of the CDrom.

-Wolfgang
