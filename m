Date: Fri, 5 Dec 2008 15:31:48 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm utilities, metadata format, CRC (checksum)
Message-ID: <20081205153148.GB26097@agk.fab.redhat.com>
References: <405732.8018.qm@web38304.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <405732.8018.qm@web38304.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: beachhangar@yahoo.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Dec 05, 2008 at 07:06:03AM -0800, Michael Jensen wrote:
> Earlier attempts at being able to get a storage based snapshot on the same server as its master failed because -
> - the master is always mounted (production)
> - the utilities recognize both master and snap and declare duplicate
> - manual edits of the header and label field failed because both are "wrapped" with CRC that is calculated and checked by the utilities

That was obfuscated deliberately to dissuade people from thinking it's OK to
edit those fields directly on disk instead of using the supplied tools!

Search the list archives - the topic comes up regularly and you can do what
you need using the command line tools.

Alasdair
-- 
agk@redhat.com
