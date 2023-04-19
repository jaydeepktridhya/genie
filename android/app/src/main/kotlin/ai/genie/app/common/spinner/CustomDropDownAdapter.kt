package ai.genie.app.common.spinner

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.TextView
import androidx.core.view.marginTop
import ai.genie.app.R
import ai.genie.app.common.extension.getProperTextColor

class CustomDropDownAdapter(val context: Context, var dataSource: List<String>) : BaseAdapter() {

    private val inflater: LayoutInflater =
        context.getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater

    override fun getView(position: Int, convertView: View?, parent: ViewGroup?): View {

        val view: View
        var vh: ItemHolder
        if (convertView == null) {
            view = inflater.inflate(R.layout.custom_spinner_item, parent, false)
            vh = ItemHolder(view)
            view?.tag = vh
        } else {
            view = convertView
            vh = view.tag as ItemHolder
        }
        vh.label.text = dataSource[position]
        vh.label.setTextColor(context.getProperTextColor())
        if (position == 0) {
            vh.line.visibility = View.GONE
        } else {
            vh.line.visibility = View.VISIBLE
        }

        return view
    }

    override fun getItem(position: Int): Any {
        return dataSource[position];
    }

    override fun getCount(): Int {
        return dataSource.size;
    }

    override fun getItemId(position: Int): Long {
        return position.toLong();
    }

    private class ItemHolder(row: View?) {
        val label: TextView
        val line: View

        init {
            label = row?.findViewById(R.id.tvSpinner) as TextView
            line = row.findViewById(R.id.view) as View
        }
    }

}