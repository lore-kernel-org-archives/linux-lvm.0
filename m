From: "Anthony W. Marino" <anthony@AWMObjects.com>
Subject: Re: [linux-lvm] System Suggestions
References: <auto-000021455115@front2.mail.megapathdsl.net>
    <20020306194023.GB32504@auctionwatch.com>
In-Reply-To: <20020306194023.GB32504@auctionwatch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <auto-000020218640@front1.mail.megapathdsl.net>
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
Date: Wed Mar  6 14:22:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Petro <petro@auctionwatch.com>, linux-lvm@sistina.com
Cc: linux-xfs@oss.sgi.com, mysql@lists.mysql.com

On Wednesday 06 March 2002 02:40 pm, Petro wrote:
> On Wed, Mar 06, 2002 at 11:52:30AM -0500, Anthony W. Marino wrote:
> > Could someone, please, provide me with a link and/or facilitate some
> > suggestons for configuration of the following components for a new DB
> > server hosting MySQL 4.01MAX?  I'm only looking to get a start and don't
> > expect "THE" answer since all things are relative and I will have to
> > further test the various scenarios.
> > SuSE 7.3-2.4.18
> > 512MB RAM
> > 4x40GB Maxtor IDE (7200RPM) drives
> > 3Ware 7800 RAID Controller
> > LVM
> > XFS
>
>     You really don't provide us with enough information here.
>
>     How big is your database, both in total size and in number of
>     tables. How are those tables utilized, when they get used do you
>     primarily open one table, manipulate it, then close it, or do you go
>     across a bunch of tables?
>
>     All of these, and more will have a dramatic impact on how you set
>     this stuff up.

Thanks.  I'm more concerned about any specifics as it applies to MySQL Max 
and XFS, RAID and LVM as a whole.  Are there any nuances as it applies to the 
whole?

Anthony
