From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] lvchange not being able to change read/write permission !!!
Message-ID: <20030402134839.B26952@uk.sistina.com>
References: <689F43A6CF84E541A721C5C3FD5ADECC1A13B9@blr-m3-msg.wipro.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <689F43A6CF84E541A721C5C3FD5ADECC1A13B9@blr-m3-msg.wipro.com>; from sharad.tiwari@wipro.com on Mon, Mar 31, 2003 at 09:41:26AM +0530
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
Date: Wed Apr  2 06:49:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Mar 31, 2003 at 09:41:26AM +0530, Sharad Tiwari wrote:
> 	Is this a bug ?

Yes, the call to the function that commits the change to the metadata
seems to have disappeared during some restructuring work last year.
I'll put it back!  [Only lvchange --permission affected by this bug.]

Alasdair
-- 
agk@uk.sistina.com
