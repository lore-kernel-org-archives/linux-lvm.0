Date: Fri, 7 Jan 2000 18:14:47 GMT
Message-Id: <200001071814.SAA27064@dukat.scot.redhat.com>
Resent-Message-ID: <14454.11543.314058.762282@dukat.scot.redhat.com>
Resent-To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>,
        linux-LVM@msede.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
From: "Stephen C. Tweedie" <sct@redhat.com>
Subject: [linux-lvm] Re: Backing up life filesystems
In-Reply-To: <Pine.LNX.4.02.10001071011260.9693-100000@carissimi.coda.cs.cmu.edu>
References: <14453.63001.151113.328292@dukat.scot.redhat.com>
	<Pine.LNX.4.02.10001071011260.9693-100000@carissimi.coda.cs.cmu.edu>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Peter J. Braam" <braam@cs.cmu.edu>
Cc: "Stephen C. Tweedie" <sct@redhat.com>, linux-ha@muc.de, Lars Marowsky-Bree <lmb@kernel.org>, Larry McVoy <lm@bitmover.com>, mauelsha@ez-darmstadt.telekom.de

Hi,

On Fri, 7 Jan 2000 10:13:00 -0500 (EST), "Peter J. Braam"
<braam@cs.cmu.edu> said:

> I fully concur that snapshots are good for this purpose.  Are the LVM
> snapshots coming at the expense of suspending striping?  They are not
> the "copy on write" snapshots which WAFL, Coda/AFS and our little
> project (www.lustre.org) have right?

They should be proper COW from what I understand: Heinz, correct me if
I'm wrong?

--Stephen
