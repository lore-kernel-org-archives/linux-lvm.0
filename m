Date: Tue, 9 Oct 2001 08:47:17 +0100
Subject: Re: [linux-lvm] LVM metsdata
Message-ID: <20011009084717.B398@btconnect.com>
References: <20011008204254.19061.qmail@web20201.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011008204254.19061.qmail@web20201.mail.yahoo.com>; from leegotze@yahoo.com on Mon, Oct 08, 2001 at 01:42:54PM -0700
From: Joe Thornber <thornber@btconnect.com>
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

On Mon, Oct 08, 2001 at 01:42:54PM -0700, Lee Go-Tze wrote:
> I have a novice question.  How does the LVM 
> protect its metadata.  I mean does it do some 
> sort of metadata check when machine comes up 
> (notices the system did not shutdown properly)?
> Or maybe it uses journaling? I imagine the 
> updates to lv/vg/pv structures have to be 
> transactional.

Transactional updates will go into LVM after mid November.  Checksums
for the metadata will also go in at this point.  ATM problems are
spotted by consistency checks (the is a lot of duplication between the
pv's).  If a problem is spotted the administrator can restore from the
automatic metadata backups.

- Joe
