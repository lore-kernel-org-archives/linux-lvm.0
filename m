content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] read-only media in a LVM? 
Message-ID: <C42D120999B1CC4C886B6BB2832F356019BF8D@hermes.genomatica.com>
From: "Sean P. Kane" <spkane@genomatica.com>
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
Date: Mon Jun 23 12:51:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Does a snapshot create a copy of all the files in memory? Just the files
that changed? Or just the file blocks or contents (i.e. diffs) that have
changed? So, would the snapshot have to be the same size as the cdrom or
could it be smaller?

Thanks,
Sean


------------------------------------------------------------------------
Sean P. Kane
spkane@genomatica.com
Lead Infrastructure Architect
Genomatica, Inc.
------------------------------------------------------------------------
"When we destroy something man has created we call it vandalism......
 When we destroy something that Gaia has created we call it progress."


-----Original Message-----
On Fri, Jun 13, 2003 at 04:55:40PM -0700, Sean P. Kane wrote:
> I saw this email below and was wondering if this is supported in both
dm
> and the LVM2 tools now.

The tools still don't support this, so you'll have to use dmsetup to
create a writeable snapshot of the CD.  Also be aware that you'll need
to have a suitable fs on the CD, most CD filesystems are read only.

- Joe
