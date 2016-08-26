Date: Fri, 26 Aug 2016 10:53:35 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20160826155335.GB28284@redhat.com>
References: <CAN2gjWTwXofKjUGO0RStX3=CQJLa5kR5CG945pE9=gEtucdQQA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN2gjWTwXofKjUGO0RStX3=CQJLa5kR5CG945pE9=gEtucdQQA@mail.gmail.com>
Subject: Re: [linux-lvm] lvm2 cluster aware
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
Content-Type: text/plain; charset="utf-8"
To: su liu <liusu8788@gmail.com>
Cc: linux-lvm <linux-lvm@redhat.com>

On Fri, Aug 26, 2016 at 02:28:03PM +0800, su liu wrote:
> I have 3 nodes and they all have access to a SAN storage. One node acts as
> admin node which manage lvs(such as creating or deleting lvs)。The other two
> nodes act as compute node which run VMs. Then I want to attach the lv to
> the VMs （not  multiattach）。As I know ,the metadata is stored in PVs，then I
> create  a lv on admin node, It can be seen on compute node without lvmetad
> adn clvmd daemon running. My questions is:
> 
> 1 In this docment: http://www.tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html  It
> says that
> 
> "The key thing to remember when sharing volumes is that all the LVM
> administration must be done on one node only and that all other nodes must
> have LVM shut down before changing anything on the admin node. Then, when
> the changes have been made, it is necessary to run vgscan on the other
> nodes before reloading the volume groups." .

That HOWTO is old and out of date.  The idea in that quote is accurate,
but I don't think it claims to be a proper or sufficient way of sharing
storage with lvm.

> I have not shot down lvm on compute node ,and I have not run vgscan on
> compute node after I create lv on admin node, But I can see the lv  after I
> create it on admin node. Should I take the operation shutdown and run vgsan?

Creating an LV on one host and making it visible on another is a trivial
example, and it's not difficult to make that work.  Things quickly break
down, however, because in reality a lot more happens.

RHEV/ovirt did what you're describing some years ago.  They use their own
software to manage lvm on shared storage, for about the same use you have.
You could ask them about it.

> 2 If I do not use clvmd or lvmlockd, Shoud I run additional operation to
> activate the lvs on compute node before attaching it to VM. and Shoud I do
> another after I run the delete lv operation on admin node? As I have tried
> yesterday, After I run lvremove lv on admin node, It is still has file in
> directory /dev/myvg/ on compute node.

That's just the beginning of the "reality" I mentioned above.
Managing lvm on shared storage is not as simple as you expect.
I suggest either using an existing solution, or export the LVs
with iscsi and skip the shared storage part.

Dave
