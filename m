Subject: Re: [linux-lvm] Snapshots problem
Message-ID: <28556-69420@sneakemail.com>
References: <003301c334b5$53d50460$e601010a@h17119.findquick.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <003301c334b5$53d50460$e601010a@h17119.findquick.com>
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
Date: Thu Jun 19 12:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

beboy wrote 61 lines:

> I have two snapshots are shown
> as ORPHAN which cannot be deleted (another thing is their date are shown
> as 'bogus' in snaptab). This causes the issue that all the snapshots
> following them cannot be deleted also. Is there any forced method can
> achieve my goal? Which command should I use and what kind of document
> can be found on some web sites? 

Did you try "vgscan -r"?  See ->man vgscan 

-Wolfgang
