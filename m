From: Benjamin Scott <bscott@ntisys.com>
Subject: Re: [linux-lvm] offtopic but ...
In-Reply-To: <60930000.1021380222@[192.168.200.4]>
Message-ID: <Pine.LNX.4.44.0205140904290.15041-100000@dragon.inside.ntisys.com>
MIME-Version: 1.0
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
Date: Tue May 14 08:08:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, 14 May 2002, at 7:43am, Steven Lembark wrote:
> You mount take the read-only mirror of the data or bring one of the
> alternate servers on line.

  Exactly.  Keeping everything "live" is not acceptable, regardless of how
good your storage is.  The latencies involved in accessing offline systems
is a feature, not a bug: It is much harder to accidentally destroy an
offline copy than it does to destroy an online one.  If multiple offline
copies are stored in different locations inside locked vaults, accidental
destruction becomes very hard indeed.  :-)

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |
